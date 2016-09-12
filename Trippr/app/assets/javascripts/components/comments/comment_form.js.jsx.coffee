@CommentForm = React.createClass
  getInitialState: ->
    content: ""
    user_id: @props.creator_id
    post_id: @props.post_id
  handleChange: (e) ->
    name = e.target.name
    @setState "#{name}": e.target.value
  valid: ->
    @state.content
  handleSubmit: (e) ->
    e.preventDefault()
    url = "/events/#{@props.event_id}/posts/#{@state.post_id}/comments"
    $.post url, {comment: @state}, (newComment) =>
      console.log(newComment)
      @props.handleNewComment newComment
      @setState @getInitialState()
    , 'JSON'
  render: ->
    `<form className="form-inline postForm" onSubmit={this.handleSubmit}>
      <div className="form-group">
        <input className='form-control' name="content" value={this.state.content} onChange={this.handleChange} ></input>
      </div>
      <div className="form-group">
        <input type="hidden" name="user_id" value={this.state.user_id} className='form-control'></input>
      </div>
      <div className="form-group">
        <input type="hidden" name="post_id" value={this.props.post_id} className='form-control'></input>
      </div>
      <button className='btn btn-info' disabled={!this.valid()}>Commment</button>
    </form>
    `
