module Admin
  module Withdraws
    class MxtsController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Mxt'

       def index
        start_at = DateTime.now.ago(60 * 60 * 24 * 3)
        @one_mxts = @mxts.with_aasm_state(:almost_done).order("id DESC")
        @all_mxts = @mxts.without_aasm_state(:almost_done).where('created_at > ?', start_at).order("id DESC")
      end

       def show
      end

       def update
        @mxt.process!
        redirect_to :back, notice: t('.notice')
      end

       def destroy
        @mxt.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end