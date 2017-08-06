class WikiPolicy
  attr_reader :user, :wiki

  def initialize(user, wiki)
    @user = user
    @wiki = wiki
  end

  def update?
    user.present?
  end

    class Scope
      attr_reader :user, :scope

      def initialize(user, scope)
        @user = user
        @scope = scope
      end

      def resolve
        wikis = []
        if user.role == 'admin'
          wikis = scope.all # if the user is an admin, show them all the wikis
        elsif user.role == 'premium'
          all_wikis = scope.all
          all_wikis.each do |wiki|
            unless wiki.private?
              wikis << wiki
            else wiki.user_id == user || wiki.collaborators.include?(user)
              wikis << wiki
            end
        end
      else # standard user
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          unless wiki.private?
            wikis << wiki
          else wiki.collaborators.include?(user)
            wikis << wiki
          end
        end
      end
      wikis
    end
  end
end
