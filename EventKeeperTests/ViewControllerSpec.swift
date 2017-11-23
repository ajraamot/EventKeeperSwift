//
//  ViewControllerSpec.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//
import Quick
import Nimble
@testable import EventKeeper

class ViewControllerSpec: QuickSpec {
    override func spec() {
        describe("ViewController") {
            var subject: ViewController!
            beforeEach {
                subject = UIStoryboard(name: "Main", bundle:
                    nil).instantiateViewController(withIdentifier:
                        "ViewController") as! ViewController
                _ = subject.view
            }

//            context("when the view loaded") {
//                it("should return 3") {
//                    expect(subject.returnThree()).to(equal(3))
//                }
//            }
//            
//            context("when the view loaded") {
//                it("should have the correct row height") {
//                    expect(subject.rowHeight).to(equal(70))
//                }
//            }
        }
    }
}
