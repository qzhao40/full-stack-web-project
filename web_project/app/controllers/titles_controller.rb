class TitlesController < InheritedResources::Base

  private

    def title_params
      params.require(:title).permit(:body, :published_at, :user_id)
    end
end

