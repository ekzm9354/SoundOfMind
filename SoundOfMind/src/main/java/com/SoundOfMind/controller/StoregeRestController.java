package com.SoundOfMind.controller;



import org.python.core.PyFunction;
import org.python.core.PyInteger;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.SoundOfMind.mapper.StoregeMapper;

@RestController
public class StoregeRestController {

	@Autowired
	private StoregeMapper mapper;
	
// jypthon 사용 하기위한 interpreter
	private static PythonInterpreter interpreter;
	
	@GetMapping("/stt.do")
	public String stt() {
		System.setProperty("python.import.site", "false");
		interpreter = new PythonInterpreter();
		interpreter.execfile("src/main/python/test.py");
		interpreter.exec("print(testFucn(5,10))");
		
		PyFunction pyFucion = interpreter.get("testFucn",PyFunction.class);
		
		int a = 10;
		int b = 20;
		
		PyObject pyobj = pyFucion.__call__(new PyInteger(a), new PyInteger(b));
		System.out.println(pyobj.toString());
		
		return "pyobj.toString()";
	}
	

}
