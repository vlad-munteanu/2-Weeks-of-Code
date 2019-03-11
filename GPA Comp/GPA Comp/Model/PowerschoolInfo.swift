//
//  PowerschoolInfo.swift
//  GPA Comp
//
//  Created by Vlad Munteanu on 3/11/19.
//  Copyright © 2019 Vlad Munteanu. All rights reserved.
//

import Foundation
import WKZombie

public class PowerschoolInfo {
    
    
    
    /*
     >>> execute("""
     document.getElementById("btn-enter-sign-in").click()
     """)
     */
    
    
    class func setUpAuth(url: URL, username: String, password: String) {
        //https://ps.fccps.org/public/home.html
//        open(url)
//            >>* get(by: .id("fieldAccount"))
//            >>> setAttribute("value", value: username)
//            >>* get(by: .id("fieldPassword"))
//            >>> setAttribute("value", value: password)
//            >>* get(by: .name("form2"))
//            >>> submit(then: PostAction.wait(3.0))
//            >>* get(by: SearchType.id("s_m_HeaderContent_picctrlthumbimage"))
//            === myOutput
////
        open(url)
            >>* get(by: .id("fieldAccount"))
            >>> setAttribute("value", value: username)
            >>* get(by: .id("fieldPassword"))
            >>> setAttribute("value", value: password)
            >>* get(by: .name("LoginForm"))
            >>> submit(then: .wait(2.0))
            >>> getAll(by: .contains("allign=", "GPA"))
            === handleResult
        
    }
    
    class func handleResult(_ result: Result<[HTMLTableRow]>) {
         print(result)
    }
    
    class func pullInfo() {
        
    }
}

