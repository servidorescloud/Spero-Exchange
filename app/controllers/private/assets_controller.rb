module Private
  class AssetsController < BaseController
    skip_before_action :auth_member!, only: [:index]

    def index
      @brl_assets  = Currency.assets('brl')
      @btc_proof   = Proof.current :btc
      @brl_proof   = Proof.current :brl
      @doge_proof   = Proof.current :doge
      @ltc_proof   = Proof.current :ltc
      @spero_proof   = Proof.current :spero
      @mxt_proof   = Proof.current :mxt
      @eth_proof   = Proof.current :eth
      #proof

      if current_user
        @btc_account = current_user.accounts.with_currency(:btc).first
        @brl_account = current_user.accounts.with_currency(:brl).first
        @doge_account = current_user.accounts.with_currency(:doge).first
        @ltc_account = current_user.accounts.with_currency(:ltc).first
        @spero_account = current_user.accounts.with_currency(:spero).first
        @mxt_account = current_user.accounts.with_currency(:mxt).first
        @eth_account = current_user.accounts.with_currency(:eth).first
        #account
      end
    end

    def partial_tree
      account    = current_user.accounts.with_currency(params[:id]).first
      @timestamp = Proof.with_currency(params[:id]).last.timestamp
      @json      = account.partial_tree.to_json.html_safe
      respond_to do |format|
        format.js
      end
    end

  end
end