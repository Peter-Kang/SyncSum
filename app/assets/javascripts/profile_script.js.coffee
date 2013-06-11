function editDetails()  
{
	document.getElementById("details").style.display = "none";
	document.getElementById("editButton").style.display = "none";
	
	document.getElementById("editDetails").style.display = "block";
	document.getElementById("saveAndCancel").style.display = "block";
}

function saveDetails()  
{
	
	
	document.getElementById("details").style.display = "block";
	document.getElementById("editButton").style.display = "block";
	
	document.getElementById("editDetails").style.display = "none";
	document.getElementById("saveAndCancel").style.display = "none";
}

function cancelEdit()  
{
	document.getElementById("details").style.display = "block";
	document.getElementById("editButton").style.display = "block";
	
	document.getElementById("editDetails").style.display = "none";
	document.getElementById("saveAndCancel").style.display = "none";
}

function addExperience()
{
	document.getElementById("addExperience").style.display = "block";
	document.getElementById("cancelExp").style.display = "block";
	document.getElementById("addExp").style.display = "none";
	
	document.getElementById("addEducation").style.display = "none";
	document.getElementById("cancelEdu").style.display = "none";
	document.getElementById("addEdu").style.display = "block";
}

function cancelExperience()
{
	document.getElementById("addExperience").style.display = "none";
	document.getElementById("cancelExp").style.display = "none";
	document.getElementById("addExp").style.display = "block";
}

function addEducation()
{
	document.getElementById("addEducation").style.display = "block";
	document.getElementById("cancelEdu").style.display = "block";
	document.getElementById("addEdu").style.display = "none";
	
	document.getElementById("addExperience").style.display = "none";
	document.getElementById("cancelExp").style.display = "none";
	document.getElementById("addExp").style.display = "block";
}

function cancelEducation()
{
	document.getElementById("addEducation").style.display = "none";
	document.getElementById("cancelEdu").style.display = "none";
	document.getElementById("addEdu").style.display = "block";
}

function addJob()
{
	document.getElementById("jobPosting").style.display = "block";
	document.getElementById("cancelJob").style.display = "block";
	document.getElementById("addJob").style.display = "none";
}

function cancelJob()
{
	document.getElementById("jobPosting").style.display = "none";
	document.getElementById("cancelJob").style.display = "none";
	document.getElementById("addJob").style.display = "block";
}