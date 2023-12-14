package com.web.www.domain.member;

public enum Grade {
	
 	Bronze(0), 
    Silver(3),
    Gold(5), 
    VIP(10),
    Manager(7);

    private final int discountRate;

    private Grade(int discountRate) {
        this.discountRate = discountRate;
    }

    public int getDiscountRate() {
        return discountRate;
    }
	    
}
