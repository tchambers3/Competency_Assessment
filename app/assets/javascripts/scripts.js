var question_number = 0;
var num_questions = 0;

function initAssessment(num_q){
  num_questions = num_q;
  if(num_questions > 0){
    $("#question-0").show();
  }
  if(num_questions > 1){
    $("#assessment-next").show();
  } else {
    $("#assessment-submit").show();
  }
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
  if(hasCheckedRadio(question_number)) {
    $("#question-" + question_number).hide();
    question_number--;
    $("#question-" + question_number).show();
    buttonUpdate();
  } else {
    displayError("This question is required to continue.");
  }
}

function buttonUpdate() {
  removeError();
  if(question_number == 0) {
    $("#assessment-submit").hide();
    $("#assessment-prev").hide();
    $("#assessment-next").show();
  } else if(question_number == num_questions - 1){
    $("#assessment-submit").show();
    $("#assessment-prev").show();
    $("#assessment-next").hide();
  } else {
    $("#assessment-submit").hide();
    $("#assessment-prev").show();
    $("#assessment-next").show();
  }
}

function validAssessment() {
  for(var i = 0; i < num_questions; i++) {
    if(!hasCheckedRadio(i)) {
      displayError("This question is required to continue.");
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