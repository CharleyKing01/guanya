package org.charley.controller.front;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class FrontIndexController {

    @GetMapping("/front/index.do")
    public String index(){
        return "12312312";
    }


}
