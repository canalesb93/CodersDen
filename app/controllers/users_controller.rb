class UsersController < ApplicationController
  include WebScraperHelper

  def show
    @user = User.find(params[:id])
    
    @online_judges = []

    @user.online_judges.each do |oj|
      a = {}
      a["online_judge"] = oj

      solved = nil
      if oj.site == "Caribbean Online Judge (COJ)"
        solved = coj_solved_problems(oj.account_name)
      elsif oj.site == "UVa Online Judge" 
        solved = uva_solved_problems(oj.account_name)
      elsif oj.site == "Sphere Online Judge" 
        solved = spoj_solved_problems(oj.account_name)
      elsif oj.site == "ACM-ICPC Live Archive" 
        solved = live_archive_solved_problems(oj.account_name)
      end

      if solved != nil 
        a["problems"] = solved[0]
        a["user"] = solved[1]
      end

      @online_judges.push(a)
    end

  end

end
