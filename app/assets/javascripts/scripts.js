/*
 * ============================================================================
 * Assessment Report Code
 * ============================================================================
 */

function createLevelsChart(indicators_resources, levels) {
  var id = "levels-chart";
  var categories = [];
  var data = [];

  for(var i = 0; i < levels.length; i++) {
    var level_data = {
      name: levels[i].name,
      data: (new Array(Object.keys(indicators_resources).length)).fill(0)
    };
    data.push(level_data);
  }
  var stage_pos = 0;
  for(var stage in indicators_resources) {
    categories.push(stage);

    var indicators = indicators_resources[stage];
    for(var i = 0; i < indicators.length; i++) {
      var level_name = indicators[i].level.name;

      var level = data.filter(function( obj ) {
        return obj.name == level_name;
      });

      level[0].data[stage_pos]++;
    }
    stage_pos++;
  }

  createChart(id, "column", "Assessment Result", "Stages", "Indicators", categories, data);
}

function createChart(container_id, type, title, x_title, y_title, categories, data) {
  Highcharts.chart(container_id, {
    chart: {
      type: type
    },
    title: {
      text: title
    },
    xAxis: {
      categories: categories,
      title: {
          text: x_title
      }
    },
    yAxis: {
      min: 0,
      title: {
          text: y_title
      },
      stackLabels: {
          enabled: true,
          style: {
              fontWeight: 'bold',
              color: (Highcharts.theme && Highcharts.theme.textColor) || 'gray'
          }
      }
    },
    legend: {
      align: 'right',
      x: -30,
      verticalAlign: 'top',
      y: 25,
      floating: true,
      backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
      borderColor: '#CCC',
      borderWidth: 1,
      shadow: false
    },
    tooltip: {
      headerFormat: '<b>{point.x}</b><br/>',
      pointFormat: '{series.name}: {point.y}<br/>Total: {point.stackTotal}'
    },
    plotOptions: {
      column: {
          stacking: 'normal',
          dataLabels: {
              enabled: true,
              color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
          }
      }
    },
    series: data
  });
}


/*
 * ============================================================================
 * Assessments Code
 * ============================================================================
 */

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
  var elem = $("#assessment-bar")[0]; 
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
