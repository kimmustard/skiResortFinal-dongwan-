package com.web.www.domain.rental;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.www.repository.RentalDAO;

@Component
public class RentalItemImageRead {
	
	@Autowired
	private RentalDAO rdao;
	
	public void read() {
		try {
			InputStream input = RentalItemRead.class.getClassLoader().getResourceAsStream("rentalItemImageProperties.properties");
			
			if (input == null) {
                System.out.println("rentalItemImageProperties.properties 정보가 없습니다. 경로를 확인해주세요");
                return;
            }
			
			// 프로퍼티스 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            String line;
            
            while ((line = reader.readLine()) != null) {
            	String[] parts = line.split(",");
            	rentalItemImageVO riivo = new rentalItemImageVO();
            	riivo.setRentalListItemNum(Long.parseLong(parts[0]));
            	riivo.setFileName(parts[1]);
            	riivo.setImageUrl(parts[2]);
            	rdao.insertRentalItemImage(riivo);
            }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
