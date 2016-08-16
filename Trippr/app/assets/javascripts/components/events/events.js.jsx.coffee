@Events = React.createClass
    getInitialState: ->
      created_events: @props.created_events
      guested_events: @props.guested_events
    getDefaultProps: ->
      created_events: []
      guested_events: []
    addEvent: (event) ->
      created_events = @state.created_events.slice()
      created_events.push event
      @setState created_events: created_events
    render: ->
      `<div>
        <div className='created_events'>
          <h1 className= 'title'>created_events</h1>
          <EventForm handleNewEvent={this.addEvent} creator_id={this.props.creator_id}/>
          <hr/>
          <table className='table table-bordered'>
            <thead>
              <tr>
                <th>Title</th>
                <th>Description</th>
              </tr>
            </thead>
            <tbody>
              {this.state.created_events.map(function(event) {
                return <Event key={event.id} event={event}/>
              })}
            </tbody>
          </table>
        </div>
        <hr/>
        <div className='guested_events'>
        <h1 className= 'title'>guested_events</h1>
        <hr/>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Title</th>
              <th>Description</th>
            </tr>
          </thead>
          <tbody>
            {this.state.guested_events.map(function(event) {
              return <Event key={event.id} event={event}/>
            })}
          </tbody>
        </table>
      </div>
      </div>`
