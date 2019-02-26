@SettingsUI = flight.component ->

    #console.log gon.current_user

  @after 'initialize', ->
    @accounts = gon.accounts
