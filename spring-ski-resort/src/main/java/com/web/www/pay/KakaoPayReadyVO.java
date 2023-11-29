package com.web.www.pay;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class KakaoPayReadyVO {
	
	// 응답받기
    private String tid, next_redirect_pc_url;
    private Date created_at;
}
