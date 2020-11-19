package com.suyi.controller;

import com.github.pagehelper.PageInfo;
import com.suyi.domain.Department;
import com.suyi.domain.Doctor;
import com.suyi.domain.Medicine;
import com.suyi.domain.Register;
import com.suyi.service.DepartmentService;
import com.suyi.service.DoctorService;
import com.suyi.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    private RegisterService registerService;

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private DoctorService doctorService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
                             @RequestParam(name = "size",required = true,defaultValue = "10") int size,
                             @RequestParam(name = "rid",required = true,defaultValue = "0") Integer rid,
                             String name,
                             @RequestParam(name = "department",required = true,defaultValue = "0") Integer department){
        List<Register> registerList = registerService.selectByRidAndNameAndDepartment(page, size,rid,name,department);
        List<Department> departmentList = departmentService.selectAll();
        List<Doctor> doctorList = doctorService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        PageInfo<Register> pageInfo = new PageInfo<>(registerList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.addObject("doctorList",doctorList);
        modelAndView.addObject("rid",rid);
        modelAndView.addObject("name",name);
        modelAndView.addObject("department",department);
        modelAndView.setViewName("register/index");
        return modelAndView;
    }

    @RequestMapping("/view")
    public ModelAndView view(Integer rid){
        Register register = registerService.selectByPrimaryKey(rid);
        List<Department> departmentList = departmentService.selectAll();
        List<Doctor> doctorList = doctorService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("register",register);
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.addObject("doctorList",doctorList);
        modelAndView.setViewName("register/look");
        return modelAndView;
    }

    @RequestMapping("/toadd")
    public ModelAndView toadd(){
        List<Department> departmentList = departmentService.selectAll();
        List<Doctor> doctorList = doctorService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.addObject("doctorList",doctorList);
        modelAndView.setViewName("register/add");
        return modelAndView;
    }

    @PostMapping("/add")
    public String add(Register register){
        boolean b = registerService.insertSelective(register);
        if (b){
            return "redirect:/register/list";
        }
        return "redirect:/register/toadd";
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(Integer rid){
        Register register = registerService.selectByPrimaryKey(rid);
        List<Department> departmentList = departmentService.selectAll();
        List<Doctor> doctorList = doctorService.selectAll();
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("register",register);
        modelAndView.addObject("doctorList",doctorList);
        modelAndView.addObject("departmentList",departmentList);
        modelAndView.setViewName("register/edit");
        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(Register register){
        boolean b = registerService.updateByPrimaryKeySelective(register);
        if (b){
            return "redirect:/register/list";
        }
        return "redirect:/register/toupdate";
    }

    @RequestMapping("/deleteButch")
    public String deleteButch(Integer rid){
        boolean b = registerService.deleteByPrimaryKeyButch(rid);
        if (b){
            return "redirect:/register/list";
        }
        return "redirect:/register/toadd";
    }
}
