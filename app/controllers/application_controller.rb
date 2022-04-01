class ApplicationController < ActionController::Base
    def helloblabla
        render html: 'Hello, salut!'
    end
    def alta_ruta
        # render html: 'Ai intrat pe alta ruta!'
    end
    def create_user
        user = User.create(name: params[:bla])
        render html: "Userul a fost creat #{user.id}"
    end 

end