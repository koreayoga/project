package org.zerock.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommonController {
   @GetMapping("/accessError")
   public void accessDenied(Authentication auth, Model model) {
      log.info("--------------------------Access Denied : "+auth);
      model.addAttribute("msg", "Access Denied_Controller");
   }
   
   @GetMapping("/customLogin")
   public void loginInput(String error, String logout, Model model) {
      log.info("-------------------------Error : "+error);
      log.info("------------------------Logout : "+logout);
      
      if(error != null) {
         model.addAttribute("error","Login Error : Check Your ID & PW");
         log.info(error);
      }
      
      if(logout != null) {
         model.addAttribute("logout","Logout!!!");
         log.info(logout);
      }
   }
   
   @GetMapping("/customLogout")
   public void logoutGet() {
      log.info("-----------------------------Logout!!");
   }
   
   
}