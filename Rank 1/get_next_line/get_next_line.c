/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line.c                                    :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: mortins- <mortins-@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/12/02 15:18:57 by mortins-          #+#    #+#             */
/*   Updated: 2022/12/07 16:10:24 by mortins-         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include"get_next_line.h"

char	*get_next_line(int fd)
{
	static char	box[BUFFER_SIZE + 1];
	char		*line;

	if (read(fd, NULL, 0) < 0)
	{
		*box = 0;
		return (NULL);
	}
	line = NULL;
	while (box[0] || read(fd, box, BUFFER_SIZE))
	{
		line = get_strjoin(line, box);
		if (check_newline(box))
			break ;
	}
	return (line);
}

/* #include<stdio.h>
#include<fcntl.h>

int	main(void)
{
	int	i = 0;
	int	fd;

	fd = open("test.txt", O_RDONLY);
	while (i++ < 33)
		printf("%s", get_next_line(fd));
} */
