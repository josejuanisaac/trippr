@PostForm = React.createClass
  getInitialState: ->
    body: ""
    creator_id: @props.creator_id
    event_id: @props.event_id
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value
  valid: ->
    @state.body
  handleSubmit: (e) ->
    e.preventDefault()
    url = "/events/#{@state.event_id}/posts"
    $.post url, {post: @state}, (newPost) =>
      console.log(newPost)
      @props.handleNewPost newPost
      @setState @getInitialState()
    , 'JSON'
  render: ->
    `<form className="form-inline postForm" onSubmit={this.handleSubmit}>
      <div className="form-group">
        <input className='form-control' name="body" value={this.state.body} onChange={this.handleChange} ></input>
      </div>
      <div className="form-group">
        <input type="hidden" name="creator_id" value={this.state.creator_id} className='form-control'></input>
      </div>
      <div className="form-group">
        <input type="hidden" name="event_id" value={this.props.event_id} className='form-control'></input>
      </div>
      <button className='btn btn-info' disabled={!this.valid()}>Post</button>
    </form>
    `
