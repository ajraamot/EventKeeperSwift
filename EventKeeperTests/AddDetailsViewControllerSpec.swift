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
            let storyboard = UIStoryboard(name: "Main",
                                          bundle: nil)
            let sut = storyboard
                .instantiateViewController(
                    withIdentifier: "AddDetailsViewController")
                as! AddDetailsViewController

            beforeEach() {
                _ = sut.view
            }
            it("has a Title text field") {
                expect(sut.titleText).toNot(beNil())
            }
            it("has a Details text view") {
                expect(sut.eventDetails).toNot(beNil())
            }
            it("has a Save button") {
                expect(sut.saveButton).toNot(beNil())
            }
            it("has a Cancel button") {
                expect(sut.cancelButton).toNot(beNil())
            }
            it("viewDidLoad text fields have blue background") {                expect(sut.titleText.backgroundColor).to(equal(UIColor.blue.withAlphaComponent(0.1)))
            
                expect(sut.addressText.backgroundColor).to(equal(UIColor.blue.withAlphaComponent(0.1)))
                
                expect(sut.eventDetails.backgroundColor).to(equal(UIColor.blue.withAlphaComponent(0.1)))
            }
            it("viewDidLoad - Details are blank") {
                expect(sut.eventDetails.text).to(equal(""))
            }
            it("viewDidLoad - Save button is disabled") {
                expect(sut.saveButton.isEnabled).to(beFalse())
            }
            it("viewDidLoad - Cancel button is disabled") {
                expect(sut.cancelButton.isEnabled).to(beFalse())
            }
            
            it("textTitleDidChange - cancel button is enabled") {
                sut.textTitleDidChange()
                expect(sut.cancelButton.isEnabled).to(beTrue())
            }
            
            it("textTitleDidChange - save button is enabled only if both title and Details have text") {
                let sut2 = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut2.view
                sut2.textTitleDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = "Foo"
                sut2.textTitleDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = ""
                sut2.eventDetails.text = "Bar"
                sut2.textTitleDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = "Foo"
                sut2.eventDetails.text = "Bar"
                sut2.textTitleDidChange()
                expect(sut2.saveButton.isEnabled).to(beTrue())
            }
            
            it("eventDetailsDidChange - cancel button is enabled") {
                sut.eventDetailsDidChange()
                expect(sut.cancelButton.isEnabled).to(beTrue())
            }
            
            it("eventDetailsDidChange - save button is enabled only if both title and Details have text") {
                let sut2 = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut2.view
                sut2.eventDetailsDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = "Foo"
                sut2.eventDetailsDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = ""
                sut2.eventDetails.text = "Bar"
                sut2.eventDetailsDidChange()
                expect(sut2.saveButton.isEnabled).to(beFalse())
                sut2.titleText.text = "Foo"
                sut2.eventDetails.text = "Bar"
                sut2.eventDetailsDidChange()
                expect(sut2.saveButton.isEnabled).to(beTrue())
            }
            it("saveButton_click saves an Event") {
                let sut2 = storyboard
                    .instantiateViewController(
                        withIdentifier: "AddDetailsViewController")
                    as! AddDetailsViewController
                _ = sut2.view
                sut2.titleText.text = "Foo"
                sut2.eventDetails.text = "Bar"
                sut2.eventDetailsDidChange()
                let initialCount = EventManager.events.count
                sut2.saveButton.sendActions(for: UIControlEvents.touchUpInside)
                expect(EventManager.events.count).toEventually(equal(initialCount + 1))
            }
            
//            it("cancelButton_click does not save an Event") {
//                let sut2 = storyboard
//                    .instantiateViewController(
//                        withIdentifier: "AddDetailsViewController")
//                    as! AddDetailsViewController
//                _ = sut2.view
//                sut2.titleText.text = "Foo"
//                sut2.eventDetails.text = "Bar"
//                sut2.eventDetailsDidChange()
//                let initialCount = EventManager.events.count
//                sut2.cancelButton.sendActions(for: UIControlEvents.touchUpInside)
//                expect(EventManager.events.count).toEventually(equal(initialCount))
//            }
//            it("cancelButton_click reverts to last saved data (if any)") {
//                // TODO: implement this
//            }
        }
    }
    
}
