var prompt = {
	promptList: {},
	init:function(){
		$.ajax({
			url: 'https://www.reddit.com/r/writingprompts.json',
			success: prompt.postTitle
		});
	},

postTitle:function(responseData){
	var promptData = responseData.data;
	var promptPosts = promptData.children;
	var randno = Math.floor ( Math.random() * promptPosts.length);
	var randomPost = promptPosts[randno];
	prompt.promptTitle = randomPost.data.title;
	console.log(prompt.promptTitle);
	$('.prompt').text(prompt.promptTitle)
},

updateDOM: function(){
	$('p.prompt').text(prompt.promptTitle)
	}
};

$(document).ready(function(){
  prompt.init();
  $('button.refresh').click(function(){
  	prompt.init();
  });
});