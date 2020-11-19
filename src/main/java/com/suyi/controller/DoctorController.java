package com.suyi.controller;

import com.github.pagehelper.PageInfo;
import com.suyi.domain.Department;
import com.suyi.domain.Doctor;
import com.suyi.service.DepartmentService;
import com.suyi.service.DoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
    @Autowired
    private DoctorService doctorService;

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
                             @RequestParam(name = "size",required = true,defaultValue = "10") int size,
                             String name,
                             @RequestParam(name = "dno",required = true,defaultValue = "0") int dno){
        List<Doctor> doctorList = doctorService.selectByNameAndDepartment(page, size,name,dno);
        List<Department> departmentList = departmentService.selectAll();
//        List<Department> departmentList = new DepartmentController().list();
        PageInfo<Doctor> pageInfo = new PageInfo<>(doctorList);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.addObject("name",name);
        modelAndView.addObject("dno",dno);
        modelAndView.setViewName("doctor/index");
        return modelAndView;
    }

    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        List<Department> departmentList = departmentService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.setViewName("doctor/add");
        return modelAndView;
    }

    @PostMapping("/add")
    public String add(Doctor doctor,String depid){
        boolean b = doctorService.insert(doctor,depid);
        if (b){
            return "redirect:/doctor/list";
        }
        return "redirect:/doctor/toadd";
    }

    @RequestMapping("/view")
    public ModelAndView view(Integer did){
        Doctor doctor = doctorService.selectByPrimaryKey(did);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("doctor",doctor);
        modelAndView.setViewName("doctor/look");
        return modelAndView;
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(Integer did){
        Doctor doctor = doctorService.selectByPrimaryKey(did);
        List<Department> departmentList = departmentService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("doctor",doctor);
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.setViewName("doctor/edit");
        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(Doctor doctor,String depid){
        boolean b = doctorService.updateByPrimaryKey(doctor, depid);
        if (b){
            return "redirect:/doctor/list";
        }
        return "redirect:/doctor/toupdate";
    }

    @RequestMapping("/deleteButch")
    public String deleteButch(String did){
        boolean b = doctorService.deleteByPrimaryKeyButch(did);
        if (b){
            return "redirect:/doctor/list";
        }
        return "redirect:/doctor/toadd";
    }
}
