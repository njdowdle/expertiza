describe TeamsUser do
  let(:participant) { build(:participant, user_id: 1) }
  let(:team) { build(:assignment_team, id: 1) }
  let(:user) { build(:student, id: 1, name: 'no name', fullname: 'no one', participants: [participant]) }
  let(:team_user) { build(:team_user, id: 1, user: user) }
  before(:each) do
    allow(TeamsUser).to receive(:where).with(team_id: 1).and_return([team_user])
  end
  
  describe '#create_mapping_from_old_assignment' do
    it 'checks if new_team_user saved properly' do
      new_team_user = TeamsUser.new
      new_team_user.team_id = 1
      new_team_user.user_id = team_user.user_id
      expect(new_team_user.save).to eq(true)
    end
  end
end
