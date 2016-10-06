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
  handleEdit: ->
    $("#post#{this.props.post.id} .postContent").html("<input id='updatePostBody' type='text' value='#{this.props.post.body}'></input>")
    $("#post#{this.props.post.id} .saveButton").show(500)
    $("#updatePostBody").focus()

  handleSubmit: (e) ->
    e.preventDefault()
    that = this

    url = "/events/#{@props.event_id}/posts/#{@props.post.id}"
    body = document.getElementById("updatePostBody").value
    creator_id = @props.creator_id
    event_id = @props.event_id

    data = {
      body: body,
      event_id: event_id,
      creator_id: creator_id
    }


    $.ajax
      url: url
      type: 'PUT'
      data: {post: data}
      success: (response) ->
        $("#post#{that.props.post.id} .postContent").text(response.body)
        $("#post#{that.props.post.id} .saveButton").hide(300)

  renderDeleteButton: ->
    if this.props.creator_id is this.props.post.creator_id
      `<div className='col-md-1'>
        <a className="editButton" onClick={this.handleEdit}><span className="glyphicon glyphicon-pencil"></span></a>
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
        <p className="postContent">{this.props.post.body}</p>
        <button className='btn btn-info saveButton' onClick={this.handleSubmit}>Save</button>
      </div>
      {this.renderDeleteButton()}
      <Comments event_id={this.props.event_id} creator_id={this.props.creator_id} post={this.props.post}/>
    </div>`

    # `<div className="col-md-8" id={"post" + this.props.post.id}>
    #   {this.renderPost()}
    #   {this.renderDeleteButton()}
    #   {this.renderComments()}
    # </div>`
