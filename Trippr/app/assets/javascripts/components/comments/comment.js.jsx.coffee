@Comment = React.createClass
  handleDelete: (e) ->
    e.preventDefault()
    url = "/events/#{@props.event_id}/posts/#{@props.post_id}/comments/#{@props.comment.id}"
    id = this.props.comment.id
    $.ajax
      url: url
      type: 'DELETE'
      success: (response) ->
        $("#comment" + id).remove()
      error: ->
        alert("404 not found")
  handleEdit: ->
    # console.log('edit')
    $("#comment#{this.props.comment.id} p").html("<input id='updateContent' type='text' value='#{this.props.comment.content}''></input>")
    $("#comment#{this.props.comment.id} .saveButton").show(500)
  handleSubmit: (e) ->
    e.preventDefault()
    that = this
    # console.log('save')
    url = "/events/#{@props.event_id}/posts/#{@props.post_id}/comments/#{this.props.comment.id}"
    content = document.getElementById("updateContent").value
    post_id = @props.post_id
    user_id = this.props.comment.user_id

    data = {
      content: content,
      post_id: post_id,
      user_id: user_id
    }

    $.ajax
      url: url
      type: 'PUT'
      data: {comment: data}
      success: (response) ->
        $("#comment#{that.props.comment.id} p").text(response.content)
        $("#comment#{that.props.comment.id} .saveButton").hide(300)

        # console.log(response)

  renderDeleteButton: ->
    if this.props.creator_id is this.props.comment.user_id
      `<div className="col-md-1 text-left">
        <a className="editButton" onClick={this.handleEdit}><span className="glyphicon glyphicon-pencil"></span></a>
        <a className="deleteButton" onClick={this.handleDelete}><span className="glyphicon glyphicon-trash"></span></a>
      </div>`
  # renderComment: ->
  #   `<div className="col-md-11">
  #     <p>{this.props.comment.content}</p>
  #   </div>`
  render: ->
    `<div id={"comment" + this.props.comment.id}>
      <div className="col-md-11">
        <p>{this.props.comment.content}</p>
        <button className='btn btn-success saveButton' onClick={this.handleSubmit}>Save</button>
      </div>
      {this.renderDeleteButton()}
    </div>`
