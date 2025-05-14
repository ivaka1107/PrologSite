<script>
    document.getElementById('fileInput').addEventListener('change', function(event) {
      const file = event.target.files[0];
      if (!file) return;
     
      const reader = new FileReader();
     
      reader.onload = function(e) {
        const content = e.target.result;
        const lines = content.split('\n');
       
        const facts = [];
        const rules = [];
        const comments = [];
       
        lines.forEach(line => {
          const trimmed = line.trim();
         
          if (trimmed.startsWith('%')) {
            comments.push(trimmed);
          } else if (trimmed.includes(':-')) {
            rules.push(trimmed);
          } else if (trimmed && trimmed.endsWith('.')) {
            facts.push(trimmed);
          }
        });
