//
//  EventSpec.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/26/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Quick
import Nimble
import MapKit

@testable import EventKeeper

class EventSpec: QuickSpec {
    override func spec() {
        describe("Event") {
            beforeEach() {
            }
            
            it("has a title") {
                let event = Event(title: "Foo")
                expect(event.title).to(equal("Foo"))
            }
            
            it("has a title and description") {
                let event = Event(title: "Foo", details: "Bar")
                expect(event.title).to(equal("Foo"))
                expect(event.details).to(equal("Bar"))
            }

            it("sets location") {
                let boulder = CLLocationCoordinate2D(latitude: 40.0, longitude: -105.26)
                let event = Event(title: "Foo", details: "Bar", location: boulder)
                expect(event.location?.latitude).to(equal(40.0))
            }
//
//            it("sets timestamp") {
//                let event = Event(title: "", timestamp: 0.0)
//                expect(event.timestamp).to(equal(0.0))
//            }
            
            // TODO: equality
            
        }
    }
}
