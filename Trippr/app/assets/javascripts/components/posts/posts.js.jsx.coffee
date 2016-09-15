@Posts = React.createClass
  getInitialState: ->
    posts: @props.posts
    event_id: @props.event.id
  getDefaultProps: ->
    posts: []
  addPost: (post) ->
    posts = @state.posts.slice()
    posts.push post
    @setState posts: posts
  # deletePost: (post_id) ->
  #   posts = this.state.posts
  #   new_posts = posts.filter (post) ->
  #     return post.id != post_id
  #   @setState posts: new_posts
  render: ->
    that = this
    `<div>
      <div className='container'>
        <div className='row eventBox'>
          <div className='col-md-12'>
            <h1 className='eventTitle'>{this.props.event.title}</h1>
            <p className='eventDescription'>{this.props.event.description}</p>
          </div>
        </div>

        <div className='row postBox'>
          <div className="col-md-12 postForm">
            What did you do here?
            <PostForm handleNewPost={this.addPost} creator_id={this.props.creator_id} event_id={this.state.event_id}/>
          </div>
          <div className='col-md-12 postList'>
            <h1>Post</h1>
            {this.state.posts.map(function(post) {
              return <Post key={post.id} creator_id={that.props.creator_id} event_id={that.state.event_id} post={post} />
              })}
          </div>
        </div>

      </div>
    </div>`
# handleDeletePost={that.deletePost.bind(null, post.id)}
