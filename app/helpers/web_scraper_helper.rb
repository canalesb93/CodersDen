require 'mechanize'

module WebScraperHelper

  def coj_solved_problems(username)
    mechanize = Mechanize.new
    base_url = "http://coj.uci.cu/user/useraccount.xhtml?username="
    user_url = base_url+username
    base_problem_url = "http://coj.uci.cu/24h/problem.xhtml?pid="
    page = mechanize.get(user_url)
    solved_problems = []
    page.search(".//div[@id='probsACC']").search("a").map do |a|
      next if a.content == ""
      a['href'] = base_problem_url + a.content
      a['number'] = a.content
      solved_problems.push(a)
    end
    return solved_problems, user_url
  end

  #uva uses userID, not username
  def uva_solved_problems(username)
    mechanize = Mechanize.new
    base_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_authorstats&userid="
    user_url = base_url+username
    page = mechanize.get(user_url)
    base_problem_url = "https://uva.onlinejudge.org/index.php?option=com_onlinejudge&Itemid=8&page=show_problem&"
    solved_problems = []
    page.search(".//table[@align='center']").search("a").map do |a|
      prob_num = a['href'][a['href'] =~ /problem=/ .. -1]
      next if prob_num == ""
      a['href'] = base_problem_url + prob_num
      prob_num.sub! 'problem=', ''
      a['number'] = prob_num
      solved_problems.push(a)
    end
    return solved_problems, user_url
  end

  def spoj_solved_problems(username)
    mechanize = Mechanize.new
    base_url = "http://www.spoj.com/users/"
    user_url = base_url+username
    base_problem_url = "http://www.spoj.com/problems/"
    page = mechanize.get(user_url)
    solved_problems = []
    page.search(".//div[@id='user-profile-tables']").search("a").map do |a|
      next if a.content == ""
      a['href'] = base_problem_url + a.content
      a['number'] = a.content
      solved_problems.push(a)
    end
    return solved_problems, user_url
  end

  def live_archive_solved_problems(username)
    mechanize = Mechanize.new
    base_url = "https://icpcarchive.ecs.baylor.edu/index.php?option=com_onlinejudge&Itemid=19&page=show_authorstats&userid="
    user_url = base_url+username
    base_problem_url = "https://icpcarchive.ecs.baylor.edu/"
    page = mechanize.get(user_url)
    solved_problems = []
    page.search(".//table[@style='width:70%']").search("a").map do |a|
      next if a['href'] == ""
      num = a['href']
      a['href'] = base_problem_url + a['href']
      num.sub! 'index.php?option=com_onlinejudge&Itemid=8&page=show_problem&problem=', ''
      a['number'] = num
      solved_problems.push(a)
    end
    return solved_problems, user_url
  end
end