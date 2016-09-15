@Post = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    url = "/events/#{@props.event_id}/posts/#{@props.post.id}"
    id = this.props.post.id
    # console.log(url)
    # console.log(id)
    $.ajax
      url: url
      type: 'DELETE'
      success: (res) ->
        $('#post' + id).remove()
      error: ->
        alert('404 not found')
  renderDeleteButton: ->
    if this.props.creator_id is this.props.post.creator_id
      `<div className='col-md-1'>
        <a className="deleteButton" onClick={this.handleDelete}><span className="glyphicon glyphicon-trash"></span></a>
      </div>`
  # renderPost: ->
  #   `<div className='col-md-11'>
  #     <p>{this.props.post.body}</p>
  #   </div>`
  # renderComments: ->
  #    `<Comments event_id={this.props.event_id} creator_id={this.props.creator_id} post={this.props.post}/>`
  render: ->
    `<div className="col-md-8" id={"post" + this.props.post.id}>
      <div className='col-md-11'>
        <p>{this.props.post.body}</p>
      </div>
      {this.renderDeleteButton()}
      <Comments event_id={this.props.event_id} creator_id={this.props.creator_id} post={this.props.post}/>
    </div>`

    # `<div className="col-md-8" id={"post" + this.props.post.id}>
    #   {this.renderPost()}
    #   {this.renderDeleteButton()}
    #   {this.renderComments()}
    # </div>`
