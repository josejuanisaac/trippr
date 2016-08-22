@Posts = React.createClass
  getInitialState: ->
    posts: @props.posts
  getDefaultProps: ->
    posts: []
  addPost: (post) ->
    posts = @state.posts.slice()
    posts.push post
    @setState posts: posts
  render: ->
    `<div>
      <div className='container'>
        <div className='row'>
          <div className='col-md-12'>
            <h1>{this.props.event.title}</h1>
            <p>{this.props.event.description}</p>
          </div>
        </div>

        <div className='row'>
          <div className='col-md-12 postList'>
            <h1>Posts</h1>
              {this.state.posts.map(function(post) {
                return <Post key={post.id} post={post}/>
                })}
          </div>
          <PostForm handleNewPost={this.addPost} creator_id={this.props.creator_id} event_id={this.props.event.id}/>
        </div>

      </div>
    </div>`
