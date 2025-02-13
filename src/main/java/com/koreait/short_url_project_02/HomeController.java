package com.koreait.short_url_project_02;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HomeController {


    private String secretKey;

    @GetMapping("/")
    @ResponseBody
    public String home() {
        return "Main Page";
    }

}
