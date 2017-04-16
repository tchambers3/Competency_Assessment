class HomeController < ApplicationController

  # GET / (a.k.a root_path)
  def home
  end

<<<<<<< HEAD
  def dashboard
    @active_competencies = Competency.active.alphabetical
    @inactive_competencies = Competency.inactive.alphabetical
    @levels = Level.active.by_ranking
    @paradigms = Paradigm.active.by_ranking
=======
  # GET /about
  def about
  end

  # GET /dashboard
  def dashboard
>>>>>>> 21c333eb2781703dfd11d8400c4c30f9c481fd66
  end

end
