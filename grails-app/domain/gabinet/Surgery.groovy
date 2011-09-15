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
		picture(nullable:true, maxSize: 4194304 /* 4MB */)
		surgery(blank:false)
    }
	
	static searchable = true
}
