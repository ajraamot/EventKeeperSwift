//
//  EventManagerSpec.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/26/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Nimble
import Quick
import MapKit
@testable import EventKeeper

class EventManagerSpec: QuickSpec {
    override func spec() {
        describe("EventManager") {
//            var subject: EventManager!
            beforeEach() {
//                subject = EventManager()
            }
            
            it("adding Event increases events array size by one") {
                let initialCount = EventManager.events.count
                expect(EventManager.events.count).to(equal(EventManager.events.count))
//                let event = Event(title: "Foo", details: "Bar")
                EventManager.AddEvent("Foo", details: "Bar", location: nil)
                // TODO: locations should not be nil
                expect(EventManager.events.count).to(equal(initialCount + 1))
            }
            
            it("true equals true") {
                expect(true).to(beTrue())
            }
        }
    }
}
