const formAutoFill = () => {
  const newBattleForm = document.getElementById('new_battle');
  if (newBattleForm) {
    const players = document.querySelectorAll('.player-item');
    players.forEach((player) => {
      player.addEventListener('click', (e) => {
        const player1Value = document.getElementById('battle_player_1_id').value;
        const player2Value = document.getElementById('battle_player_2_id').value;
        if (player1Value === '' && player2Value === '') {
          e.currentTarget.classList.add('first-picked');
          document.getElementById('battle_player_1_id').value = e.currentTarget.dataset.playerId;
        } else if (player1Value !== '' && player2Value === '') {
          e.currentTarget.classList.add('second-picked');
          document.getElementById('battle_player_2_id').value = e.currentTarget.dataset.playerId;
        } else if (player1Value !== '' && player2Value !== '') {
          players.forEach((player) => {
            if (player.classList.contains('first-picked')) {
              player.classList.remove('first-picked');
            } else if (player.classList.contains('second-picked')) {
              player.classList.remove('second-picked');
            }
          })
          e.currentTarget.classList.add('first-picked');
          document.getElementById('battle_player_1_id').value = e.currentTarget.dataset.playerId;
          document.getElementById('battle_player_2_id').value = '';
        }
      });
    });
  }
}

export { formAutoFill };