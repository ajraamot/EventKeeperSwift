//
//  AddDetailsViewControllerSpec.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 12/1/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick
@testable import EventKeeper

class AddDetailsViewControllerSpec: QuickSpec {
    override func spec() {
        describe("AddDetailsViewController") {
            beforeEach() {
            }
            it("has a Title text field") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut.view
                expect(sut.titleText).toNot(beNil())
            }
            it("has a Details text view") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut.view
                expect(sut.eventDetails).toNot(beNil())
            }
            it("has a Save button") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut.view
                expect(sut.saveButton).toNot(beNil())
            }
            it("has a Cancel button") {
                let storyboard = UIStoryboard(name: "Main",
                                              bundle: nil)
                let sut = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut.view
                expect(sut.cancelButton).toNot(beNil())
            }
        }
    }
    
}
