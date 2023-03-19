//
//  BreedsViewModelTest.swift
//  CatALogTests
//
//  Created by Andy Kayley on 13/03/2023.
//

import Combine
import XCTest

@testable import CatALog

final class BreedViewModelTest: XCTestCase {

    func test_WhenVMInitialized_ThenLoadingStateIsPending() {

        let viewModel = BreedViewModel(
            repository: MockBreedRepository()
        )

        XCTAssertEqual(viewModel.loadingState, .pending)
    }

    func test_WhenVMFetchesBreeds_ThenLoadingStatesOccurInCorrectOrder_AndAllBreedsReturned() async throws {

        let viewModel = BreedViewModel(
            repository: MockBreedRepository()
        )

        let pendingExpectation = expectation(description: "Pending state")
        let loadingExpectation = expectation(description: "Loading state")
        let completeExpectation = expectation(description: "Complete state")

        let cancellable = viewModel.$loadingState.sink { state in
            switch state {
                case .pending:
                    pendingExpectation.fulfill()
                case .loading:
                    loadingExpectation.fulfill()
                case .complete:
                    completeExpectation.fulfill()
                case .error:
                    XCTFail("No error should be thrown")
            }
        }

        await viewModel.fetchAllBreeds()

        let breedsReturnedExpectation = expectation(description: "Breeds returned")

        switch viewModel.loadingState {
            case .complete(let breeds):
                XCTAssertEqual(2, breeds.count)
                breedsReturnedExpectation.fulfill()
            default: XCTFail("No breeds returned")
        }

        wait(
            for: [
                pendingExpectation,
                loadingExpectation,
                completeExpectation,
                breedsReturnedExpectation
            ],
            timeout: 3,
            enforceOrder: true
        )
        cancellable.cancel()
    }

    func test_WhenErrorOccursFetchingBreeds_ThenStateIsSetToError() async throws {

        var repository = MockBreedRepository()
        repository.error = MockError.repositoryError

        let viewModel = BreedViewModel(
            repository: repository
        )

        await viewModel.fetchAllBreeds()

        let mockErrorExpectation = expectation(description: "Mock error state")
        switch viewModel.loadingState {
            case .error(let error):
                switch error {
                    case MockError.repositoryError:
                        mockErrorExpectation.fulfill()
                    default:
                        XCTFail("Error is not MockError.repositoryError")
                }
            default:
                XCTFail("LoadingState is not .error(Error)")
        }
        await waitForExpectations(timeout: 3)
    }
}

extension LoadingState: Equatable {
    public static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
            case (.error, .error),
                (.pending, .pending),
                (.complete, .complete),
                (.loading, .loading):
                return true
            default:
                return false
        }
    }
}
