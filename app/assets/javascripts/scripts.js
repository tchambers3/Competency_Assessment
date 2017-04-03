var question_number = 0;
var num_questions = 0;

function initAssessment(num_q){
  num_questions = num_q;
  $("#question-0").show()
  updateAssessment();
}

function nextQuestion() {
  if(hasCheckedRadio(question_number)) {
    $("#question-" + question_number).hide();
    question_number++;
    $("#question-" + question_number).show();
    updateAssessment();
  } else {
    displayError("This question is required to continue.");
  }
}

function previousQuestion() {
  $("#question-" + question_number).hide();
  question_number--;
  $("#question-" + question_number).show();
  updateAssessment();
}

function updateAssessment() {
  buttonUpdate();
  updateProgress();
}

function buttonUpdate() {
  removeError();
  if(question_number == num_questions - 1) {
    $("#assessment-submit").show();
    $("#assessment-prev").prop('disabled', false);
    $("#assessment-next").prop('disabled', true);;
  } else if(question_number == 0){
    $("#assessment-submit").hide();
    $("#assessment-prev").prop('disabled', true);;
    $("#assessment-next").prop('disabled', false);
  } else {
    $("#assessment-submit").hide();
    $("#assessment-prev").prop('disabled', false);
    $("#assessment-next").prop('disabled', false);
  }
}

function updateProgress() {
  var elem = $("#assessmentBar")[0]; 
  var percentage = ((question_number+1)/num_questions) * 100;
  elem.style.width = percentage + "%";
  elem.innerHTML = (question_number+1) + " out of " + num_questions; 
}

function validAssessment() {
  for(var i = 0; i < num_questions; i++) {
    if(!hasCheckedRadio(i)) {
      displayError("This question is required to submit.");
      return false;
    }
  }
  return true;
}

function displayError(msg) {
  $("#assessment-errors").show();
  $("#assessment-errors").html(msg)
}

function removeError() {
  $("#assessment-errors").hide();
}

function hasCheckedRadio(q_num) {
  return $("#question-" + q_num + " input[type=radio]:checked").length > 0;
}

function iAgree(){
  $("#disclaimer-submit")[0].disabled = !$("#accept")[0].checked;
}