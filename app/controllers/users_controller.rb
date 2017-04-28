class UsersController < ApplicationController
  include WebScraperHelper

  def show
    @user = User.find(params[:id])
    
    coj_solved = nil
    @online_judges = []

    @user.online_judges.each do |oj|
      a = {}
      a["online_judge"] = oj

      if oj.site == "Caribbean Online Judge (COJ)"
        coj_solved = coj_solved_problems(oj.account_name)
        a["problems"] = coj_solved[0]
        a["user"] = coj_solved[1]
      elsif oj.site == "UVa Online Judge" 
        uva_solved = uva_solved_problems(oj.account_name)
        a["problems"] = uva_solved[0]
        a["user"] = uva_solved[1]
      elsif oj.site == "Sphere Online Judge" 
        spoj_solved = spoj_solved_problems(oj.account_name)
        a["problems"] = spoj_solved[0]
        a["user"] = spoj_solved[1]
      elsif oj.site == "ACM-ICPC Live Archive" 
        live_solved = live_archive_solved_problems(oj.account_name)
        a["problems"] = live_solved[0]
        a["user"] = live_solved[1]
      end

      @online_judges.push(a)
    end

  end

end
