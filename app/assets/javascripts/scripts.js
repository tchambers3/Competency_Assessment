var question_number = 0;
var num_questions = 0;

function initAssessment(num_q){
  num_questions = num_q;
  for(var i = 1; i < num_questions; i++){
    $("#question-" + i).hide();
  }
  buttonUpdate();
}

function nextQuestion() {
  if(hasCheckedRadio(question_number)) {
    $("#question-" + question_number).hide();
    question_number++;
    $("#question-" + question_number).show();
    buttonUpdate();
  } else {
    displayError("This question is required to continue.");
  }
}

function previousQuestion() {
  $("#question-" + question_number).hide();
  question_number--;
  $("#question-" + question_number).show();
  buttonUpdate();
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