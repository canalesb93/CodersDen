require 'mechanize'


def coj_solved_problems(username)
  mechanize = Mechanize.new
  base_url = "http://coj.uci.cu/user/useraccount.xhtml?username="
  user_url = base_url+username
  base_problem_url = "http://coj.uci.cu/24h/problem.xhtml?pid="
  page = mechanize.get(user_url)
  solved_problems = []
  page.search(".//div[@id='probsACC']").search("a").map do |a|
    a['href'] = base_problem_url + a.content
    solved_problems.push(a)
  end
  return solved_problems
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
    a['href'] = base_problem_url + prob_num
    solved_problems.push(a)
  end
  return solved_problems
end

def spoj_solved_problems(username)
  mechanize = Mechanize.new
  base_url = "http://www.spoj.com/users/"
  user_url = base_url+username
  base_problem_url = "www.spoj.com/problems/"
  page = mechanize.get(user_url)
  solved_problems = []
  page.search(".//div[@id='user-profile-tables']").search("a").map do |a|
    a['href'] = base_problem_url + a.content
    solved_problems.push(a)
  end
  return solved_problems
end

def live_archive_solved_problems(username)
  mechanize = Mechanize.new
  base_url = "https://icpcarchive.ecs.baylor.edu/index.php?option=com_onlinejudge&Itemid=19&page=show_authorstats&userid="
  user_url = base_url+username
  base_problem_url = "https://icpcarchive.ecs.baylor.edu/"
  page = mechanize.get(user_url)
  solved_problems = []
  page.search(".//table[@style='width:70%']").search("a").map do |a|
    a['href'] = base_problem_url + a['href']
    solved_problems.push(a)
  end
  return solved_problems
end

coj_solved = coj_solved_problems("ymondelo20")

puts coj_solved[0]

uva_solved = uva_solved_problems("27127")
puts uva_solved[0]

spoj_solved = spoj_solved_problems("toshi_7")
puts spoj_solved[0]

live_solved = live_archive_solved_problems("38027")
puts live_solved[0]
