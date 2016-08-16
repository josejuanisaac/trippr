@Events = React.createClass
    getInitialState: ->
      events: @props.events
    getDefaultProps: ->
      events: []
    addEvent: (event) ->
      events = @state.events.slice()
      events.push event
      @setState events: events
    render: ->
      `<div className='events'>
        <h1 className= 'title'>Events</h1>
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
            {this.state.events.map(function(event) {
              return <Event key={event.id} event={event}/>
            })}
          </tbody>
        </table>
      </div>`
