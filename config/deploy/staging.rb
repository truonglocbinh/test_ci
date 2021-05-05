set :user, 'root'
set :stage, :staging

# Pass varibale to deploy from different git branches
set :branch, 'master'

# Setup IP with ec2 server
server '68.183.132.250', user: fetch(:user), roles: %w[app web db]
# set :ssh_options, { forward_agent: true, user: fetch(:user), keys: '/Users/macOS/.ssh/binhtl.pem' }
