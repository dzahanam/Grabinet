package gabinet


class Surgery {
	//date of surgery usually today
	Date date
	
	//type of skin
	String skin
	
	//therapy description
	String therapy
	
	//recommendation
	String recommendation
	
	//surgery
	String surgery
	
	//picture of surgery (maybe list)
	byte[] picture
	
    static constraints = {
		picture(nullable:true, maxSize: 524288 /* 512K */)
		surgery(blank:false)
    }
	
	static searchable = true
}
