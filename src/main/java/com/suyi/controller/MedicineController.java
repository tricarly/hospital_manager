package com.suyi.controller;

import com.github.pagehelper.PageInfo;
import com.suyi.domain.Department;
import com.suyi.domain.Doctor;
import com.suyi.domain.Medicine;
import com.suyi.service.MedicineService;
import com.suyi.util.UploadFileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/medicine")
public class MedicineController {
    @Autowired
    private MedicineService medicineService;

    @RequestMapping("/list")
    public ModelAndView list(@RequestParam(name = "page",required = true,defaultValue = "1") int page,
                             @RequestParam(name = "size",required = true,defaultValue = "10") int size,
                             String name,
                             @RequestParam(name = "type",required = true,defaultValue = "0")Integer type){
        List<Medicine> medicineList = medicineService.selectByNameAndType(page, size,name,type);
        ModelAndView modelAndView=new ModelAndView();
        PageInfo<Medicine> pageInfo = new PageInfo<>(medicineList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.addObject("name",name);
        modelAndView.addObject("type",type);
        modelAndView.setViewName("medicine/index");
        return modelAndView;
    }

    @RequestMapping("/toadd")
    public String toadd(){
        return "medicine/add";
    }

    @PostMapping("/add")
    public String add(Medicine medicine, MultipartFile file) throws IOException {
        boolean b = medicineService.insertSelective(medicine, file);
        if (b){
            return "redirect:/medicine/list";
        }
        return "redirect:/medicine/toadd";
    }

    @RequestMapping("/view")
    public ModelAndView view(Integer mid){
        Medicine medicine = medicineService.selectByPrimaryKey(mid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("medicine",medicine);
        modelAndView.setViewName("medicine/look");
        return modelAndView;
    }

    @RequestMapping("/toupdate")
    public ModelAndView toupdate(Integer mid){
        Medicine medicine = medicineService.selectByPrimaryKey(mid);
        ModelAndView modelAndView=new ModelAndView();
        modelAndView.addObject("medicine",medicine);
        modelAndView.setViewName("medicine/edit");
        return modelAndView;
    }

    @RequestMapping("/update")
    public String update(Medicine medicine,MultipartFile file) throws IOException {
        boolean b = medicineService.updateByPrimaryKeySelective(medicine, file);
        if (b){
            return "redirect:/medicine/list";
        }
        return "redirect:/medicine/toupdate";
    }

    @RequestMapping("/deleteButch")
    public String deleteButch(String mid){
        boolean b = medicineService.deleteByPrimaryKeyButch(mid);
        if (b){
            return "redirect:/medicine/list";
        }
        return "redirect:/medicine/toadd";
    }

    @RequestMapping("/tofile")
    public String tofile(){
        return "medicine/file";
    }

    @PostMapping("/file")
    public String file(MultipartFile file) throws IOException {
        String picture = new UploadFileUtils().uploadFile(file);
        return "redirect:/medicine/tofile";
    }
}
