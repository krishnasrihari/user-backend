class RootController < ActionController::API
	def index
		revision = $redis.get('user-frontend:index:current')		
		render html: $redis.get("user-frontend:index:#{revision}").html_safe
	end
end