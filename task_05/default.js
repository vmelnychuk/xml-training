var myFunctions = {
	goBack: function() {
		if (window.location.hash !== "") {
			history.go(-1)
		}
	}
};
