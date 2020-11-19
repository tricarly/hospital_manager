package com.suyi.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/UI")
public class UIController {
    @RequestMapping("/mainUI/{path}")
    public String toMain(@PathVariable("path")String path){
        System.out.println(path);
        return "main/"+path;
    }
    @RequestMapping("/doctorUI/{path}")
    public String toDoctor(@PathVariable("path")String path){
        System.out.println(path);
        return "redirect:/doctor/"+path;
    }
    @RequestMapping("/medicineUI/{path}")
    public String toMedicine(@PathVariable("path")String path){
        System.out.println(path);
        return "redirect:/medicine/"+path;
    }
    @RequestMapping("/registerUI/{path}")
    public String toRegister(@PathVariable("path")String path){
        System.out.println(path);
        return "redirect:/register/"+path;
    }
    @RequestMapping("/usersUI/{path}")
    public String toUsers(@PathVariable("path")String path){
        System.out.println(path);
        return "users/"+path;
    }
    @RequestMapping("/topage/{path}")
    public String toPage(@PathVariable("path") String path){
        return "main/"+path;
    }
}
