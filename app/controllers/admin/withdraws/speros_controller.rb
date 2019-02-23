module Admin
  module Withdraws
    class SperosController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Spero'

       def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_speros = @speros.with_aasm_state(:accepted).order("id DESC")
        @all_speros = @speros.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

       def show
      end

       def update
        @spero.process!
        redirect_to :back, notice: t('.notice')
      end

       def destroy
        @spero.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end