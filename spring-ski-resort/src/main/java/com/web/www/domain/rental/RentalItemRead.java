package com.web.www.domain.rental;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.web.www.repository.RentalDAO;

@Component
public class RentalItemRead {
	
	@Autowired
	private RentalDAO rdao;
	
	public void read() {
		try {
			InputStream input = RentalItemRead.class.getClassLoader().getResourceAsStream("rentalItemProperties.properties");
			
			if (input == null) {
                System.out.println("RentalItemProperties.properties 정보가 없습니다. 경로를 확인해주세요");
                return;
            }
			
			// 프로퍼티스 읽기
            BufferedReader reader = new BufferedReader(new InputStreamReader(input));
            String line;
            
            while ((line = reader.readLine()) != null) {
            	String[] parts = line.split(",");
            	RentalItemVO ritvo = new RentalItemVO();
            	ritvo.setRentalListItemNum(Long.parseLong(parts[0]));
            	ritvo.setRentalListItemType(parts[1]);
            	ritvo.setRentalListItemGrade(parts[2]);
            	ritvo.setRentalListLowItem(parts[3]);
            	ritvo.setRentalListMidItem(parts[4]);
            	ritvo.setRentalListPremiumItem(parts[5]);
            	ritvo.setRentalListItemAdultFee(Integer.parseInt(parts[6]));
            	ritvo.setRentalListItemKidFee(Integer.parseInt(parts[7]));
            	ritvo.setRentalListItemCount(Integer.parseInt(parts[8]));
            	rdao.insertRentalItem(ritvo);
            }
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
